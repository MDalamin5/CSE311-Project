const elementTypes = {
  CONTAINER: 'container',
  IMAGE: 'image',
  TEXT: 'text',
  BUTTON: 'button',
  INPUT: 'input',
  SECTION: 'section',
  DROPDOWN: 'dropdown',
  LINK: 'link',
};

const elementBehaviors = {
  DROPDOWN: 'dropdown',
};

function initAspectJS() {
  getNestedElements(document.body).forEach(x => {
    if (getElementBehavior(x) === elementBehaviors.DROPDOWN) {
      setBehaviorForElement(x, elementBehaviors.DROPDOWN);
    }
  });

  window.onresize = () => {
    getNestedElements(document.body).forEach(x => {
      if (getElementType(x) === elementTypes.DROPDOWN) {
        x.style.position = bestCSSPositionForPopover(getElementForPopover(x));
      }
    });
  };
}

function setBehaviorForElement(element, behavior) {
  switch (behavior) {
    case elementBehaviors.DROPDOWN:
      setDropdownBehavior();
      break;
    default:
      break;
  }

  function setDropdownBehavior() {
    let shouldShowPopover = false;
    let didSetMouseEvents = false;
    element.onmouseenter = () => {
      shouldShowPopover = true;
      showDropdownForElement(element);

      if (!didSetMouseEvents) {
        const popover = getElementPopover(element);
        popover.onmouseenter = e => {
          shouldShowPopover = true;
          const popover = e.target;
          if (popover.parentElement == document.body) return;
          popover.style.display = 'block';
        };
        popover.onmouseleave = e => {
          shouldShowPopover = false;
          const popover = e.target;
          setTimeout(() => {
            if (shouldShowPopover) return;
            popover.style.display = 'none';
          });
        };
        const touchEvent = 'ontouchstart' in window ? 'touchstart' : 'click';
        element.addEventListener(touchEvent, () => {
          if (isElementDropdownVisible(element)) {
            hideDropdownForElement(element);
          } else {
            showDropdownForElement(element);
          }
        });
      }
      didSetMouseEvents = true;
    };
    element.onmouseleave = () => {
      shouldShowPopover = false;
      setTimeout(() => {
        if (shouldShowPopover) return;
        const popover = getElementPopover(element);
        popover.style.display = 'none';
      }, 100);
    };
  }
}

function removeBehaviorForElement(element) {
  element.onmouseover = null;
  element.onmouseleave = null;
}

function isElementDropdownVisible(element) {
  const popover = getElementPopover(element);
  return popover && popover.style.display !== 'none';
}

function getElementPopover(element) {
  if (!element) return;
  const popoverID = popoverIDForElement(element);
  return document.getElementById(popoverID);
}

function getElementForPopover(popover) {
  return document.getElementById(popover.getAttribute('data-popover-for'));
}

function popoverIDForElement(element) {
  if (!element) return;
  return element.id + 'popover';
}

function updateDropdownForElement(element) {
  const elementIsVisible = element.style.display === 'block';
  if (isElementDropdownVisible(element) && elementIsVisible) {
    showDropdownForElement(element);
  } else if (!elementIsVisible) {
    hideDropdownForElement(element);
  }
}

function showDropdownForElement(element) {
  if (getElementBehavior(element) !== elementBehaviors.DROPDOWN) return;
  const popover = getElementPopover(element);
  moveElementToTopOfHierarchy(popover);
  popover.style.display = 'block';
  const rectString = rectForPopover(element, popover);
  popover.style.left = rectString.x;
  popover.style.top = rectString.y;

  function moveElementToTopOfHierarchy(element) {
    if (!element || !element.parentNode) return;
    const firstChildOfParent =
      element.parentNode.children[element.parentNode.children.length - 1];
    element.parentNode.insertBefore(firstChildOfParent, element);
  }
}

function hideDropdownForElement(element) {
  const popover = getElementPopover(element);
  if (!popover) return;
  popover.style.display = 'none';
}

function rectForPopover(element, popover) {
  const popoverWidth = popover.getBoundingClientRect().width;
  const canvasRect = document.body.getBoundingClientRect();
  const elementRect = element.getBoundingClientRect();
  const rect = {
    x: 0,
    y: elementRect.y + elementRect.height,
  };

  let position = 'none';
  if (popoverWidth >= canvasRect.width) {
    // width too large
    rect.x = canvasRect.x;
    position;
  } else if (
    elementRect.x + elementRect.width / 2 - popoverWidth / 2 > canvasRect.x &&
    elementRect.x + elementRect.width / 2 + popoverWidth / 2 <
      canvasRect.width + canvasRect.x
  ) {
    // center align is valid
    rect.x = elementRect.x + elementRect.width / 2 - popoverWidth / 2;
    position = 'center';
  } else if (elementRect.x + popoverWidth < canvasRect.width + canvasRect.x) {
    // right align valid
    rect.x = elementRect.x;
    position = 'right';
  } else if (elementRect.x + elementRect.width - popoverWidth > canvasRect.x) {
    // left align valid
    rect.x = elementRect.x + elementRect.width - popoverWidth;
    position = 'left';
  }

  return {
    x: numToPixel(rect.x - canvasRect.x),
    y: numToPixel(rect.y - canvasRect.y),
    width: rect.width ? numToPixel(rect.width) : numToPixel(popoverWidth),
    position,
  };
}

function numToPixel(number) {
  return number + 'px';
}

function getElementType(element) {
  return element.getAttribute('data-element-type');
}

function getNestedElements(element) {
  const children = [];
  Array.from(element.children).forEach(child => {
    children.push(child);
    getNestedElements(child).forEach(nestedChild => {
      children.push(nestedChild);
    });
  });
  return children;
}

function getElementBehavior(element) {
  return element.getAttribute('data-element-behavior');
}

function bestCSSPositionForPopover(element) {
  let currentElement = element.parentElement;
  let val;
  while (currentElement && !val) {
    const position = window.getComputedStyle(currentElement).position;
    switch (position) {
      case 'fixed':
      case 'absolute':
        val = position;
        break;
      default:
        break;
    }
    currentElement = currentElement.parentElement;
  }
  if (!val) {
    val = 'absolute';
  }
  return val;
}

// forms

function submitAspectForm(form) {
  const data = {
    databaseId: form.getAttribute('data-database-id'),
    uid: form.getAttribute('data-uid'),
    content: {},
  };

  if (!data.databaseId) {
    alert('No database connected to form.');
    return false;
  }

  const inputWithUnsetDatabaseField = Array.from(
    form.getElementsByTagName('input')
  ).find(x => !x.getAttribute('data-name'));
  if (inputWithUnsetDatabaseField) {
    alert(
      `Input element "${inputWithUnsetDatabaseField.id}" is not connected to a database field.`
    );
    return false;
  }

  Array.from(form.getElementsByTagName('input')).forEach(input => {
    data.content[input.getAttribute('data-name')] = input.value;
  });

  postRequest(getUrlForType(), data)
    .then(() => {
      updateAspectFormState(form, 'submitted');
    })
    .catch(error => alert(error.message));

  return false;

  function getUrlForType(type) {
    switch (type) {
      // case 'google':
      //   return `https://docs.google.com/forms/d/${data['form-id']}`;

      default:
        return `https://api.aspect.app/v1/submit-form`;
    }
  }

  function postRequest(url, dict) {
    return new Promise((resolve, reject) => {
      var xhr = new XMLHttpRequest();
      xhr.open('POST', url, true);
      xhr.setRequestHeader('Content-Type', 'application/json');
      xhr.send(JSON.stringify(dict));
      xhr.onreadystatechange = () => {
        if (xhr.readyState == 4) {
          if (xhr.status == 200) {
            resolve(xhr.responseText);
          } else {
            try {
              reject(JSON.parse(xhr.responseText));
            } catch (error) {
              reject({message: xhr.responseText});
            }
          }
        }
      };
    });
  }
}

function updateAspectFormState(form, state) {
  form.parentElement.classList.remove('submitted-form');
  if (state == 'submitted') {
    form.parentElement.classList.add('submitted-form');
  }
}
