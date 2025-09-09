import EasyMDE  from 'easymde';
import peerages from '../entities/peerages';

export default (() => {
  // Configure EasyMDE with accessibility options
  const accessibleConfig = {
    toolbar: [
      {
        name: "bold", action: EasyMDE.toggleBold, className: "fa fa-bold", title: "Bold", "aria-label": "Toggle bold text",
      },
      {
        name: "italic", action: EasyMDE.toggleItalic, className: "fa fa-italic", title: "Italic", "aria-label": "Toggle italic text",
      },
      {
        name: "heading", action: EasyMDE.toggleHeadingSmaller, className: "fa fa-heading", title: "Heading", "aria-label": "Toggle heading",
      },
      "|",
      {
        name: "quote", action: EasyMDE.toggleBlockquote, className: "fa fa-quote-left", title: "Quote", "aria-label": "Toggle blockquote"
      },
      {
        name: "generic-list", action: EasyMDE.toggleUnorderedList, className: "fa fa-list-ul", title: "Bullet List", "aria-label": "Toggle bullet list"
      },
      {
        name: "numbered-list", action: EasyMDE.toggleOrderedList, className: "fa fa-list-ol", title: "Numbered List", "aria-label": "Toggle numbered list"
      },
      "|",
      {
        name: "link", action: EasyMDE.drawLink, className: "fa fa-link", title: "Insert Link", "aria-label": "Insert link"
      },
      {
        name: "image", action: EasyMDE.drawImage, className: "fa fa-image", title: "Insert Image", "aria-label": "Insert image"
      },
      "|",
      {
        name: "preview", action: EasyMDE.togglePreview, className: "fa fa-eye no-disable", title: "Toggle Preview", "aria-label": "Toggle markdown preview"
      },
      {
        name: "side-by-side", action: EasyMDE.toggleSideBySide, className: "fa fa-columns no-disable", title: "Toggle Side by Side", "aria-label": "Toggle side by side view"
      },
      {
        name: "fullscreen", action: EasyMDE.toggleFullScreen, className: "fa fa-arrows-alt no-disable", title: "Fullscreen", "aria-label": "Toggle fullscreen mode"
      },
      "|",
      {
        name: "guide", action: "https://www.markdownguide.org/basic-syntax/", className: "fa fa-question-circle", title: "Markdown Guide", "aria-label": "Open markdown guide"
      }
    ],
    status: false,
    placeholder: "Enter your text here...",
  }

  function createEditor(element) {
    const label = element.getAttribute('aria-label') || element.getAttribute('placeholder') || 'Markdown editor';
    element.setAttribute('aria-label', label);
    element.setAttribute('title', label);

    const editor = new EasyMDE({ element, ...accessibleConfig });

    // Fix the CodeMirror textarea accessibility
    setTimeout(() => {
    const textArea = editor.codemirror.getInputField();
      if (textArea) {
        textArea.setAttribute('aria-label', label);
      }
    }, 50);

    return editor;
  }

  const selectors = [
    "textarea[data-behavior='markdown']",
    ...peerages.map(peerage => `#user_${peerage}_attributes_bio`)
  ];
  selectors.forEach(selector => {
    const element = document.querySelector(selector);
    if (element) {
      createEditor(element);
    }
  });
})()
