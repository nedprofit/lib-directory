import EditorJS from "@editorjs/editorjs";
import Table from "@editorjs/table";
import Paragraph from "@editorjs/paragraph";
import Header from "@editorjs/header";
import Quote from "@editorjs/quote";
import Delimiter from "@editorjs/delimiter";
import SimpleImage from "@editorjs/simple-image";
import Checklist from "@editorjs/checklist";
import List from "@editorjs/list";
import Warning from "@editorjs/warning";
import Marker from "@editorjs/marker";
import CodeTool from "@editorjs/code";
import InlineCode from "@editorjs/inline-code";
import LinkTool from "@editorjs/link";
import Embed from "@editorjs/embed";
import RawTool from "@editorjs/raw";
import AIText from "@alkhipce/editorjs-aitext";

import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    if (window.editor) return;

    let main_tools = {
      header: {
        class: Header,
        inlineToolbar: ["link"],
        config: { placeholder: "Header" },
        shortcut: "CMD+SHIFT+H",
      },
      paragraph: {
        class: Paragraph,
        config: { placeholder: "Enter something" },
      },
      aiText: {
        // if you do not use TypeScript you need to remove "as unknown as ToolConstructable" construction
        // type ToolConstructable imported from @editorjs/editorjs package
        class: AIText,
        config: {
          // here you need to provide your own suggestion provider (e.g., request to your backend)
          // this callback function must accept a string and return a Promise<string>
          callback: (text) => {
            return new Promise((resolve) => {
              setTimeout(() => {
                // Simulated backend response
                resolve(
                  'ИИ исправление: Это эмуляция работы интеллектуального анализа по фразе "' +
                    text +
                    '".',
                );
              }, 1000);
            });
          },
        },
      },
      list: {
        class: List,
        inlineToolbar: true,
        shortcut: "CMD+SHIFT+L",
      },
      checklist: {
        class: Checklist,
        inlineToolbar: true,
      },
      quote: {
        class: Quote,
        inlineToolbar: true,
        config: {
          quotePlaceholder: "Enter a quote",
          captionPlaceholder: "Quote's author",
        },
        shortcut: "CMD+SHIFT+O",
      },
      warning: Warning,
      marker: {
        class: Marker,
        shortcut: "CMD+SHIFT+M",
      },
      code: {
        class: CodeTool,
        shortcut: "CMD+SHIFT+C",
      },
      delimiter: Delimiter,
      inlineCode: {
        class: InlineCode,
        shortcut: "CMD+SHIFT+C",
      },
      linkTool: LinkTool,
      embed: Embed,
      table: {
        class: Table,
        inlineToolbar: true,
        shortcut: "CMD+ALT+T",
      },
      image: SimpleImage,
      raw: RawTool,
    };

    this.editor = new EditorJS({
      autofocus: true,
      tools: main_tools,
      i18n: {
        messages: {
          ui: {
            blockTunes: {
              toggler: {
                "Click to tune": "Нажмите, чтобы настроить",
                "or drag to move": "или перетащите",
              },
            },
            inlineToolbar: {
              converter: {
                "Convert to": "Конвертировать в",
              },
            },
            toolbar: {
              toolbox: {
                Add: "Добавить",
              },
            },
            popover: {
              Filter: "Поиск",
              "Nothing found": "Ничего не найдено",
            },
          },
          toolNames: {
            Text: "Параграф",
            Heading: "Заголовок",
            List: "Список",
            Warning: "Примечание",
            Checklist: "Чеклист",
            Quote: "Цитата",
            Code: "Код",
            Delimiter: "Разделитель",
            "Raw HTML": "HTML-фрагмент",
            Table: "Таблица",
            Link: "Ссылка",
            Marker: "Маркер",
            Bold: "Полужирный",
            Italic: "Курсив",
            InlineCode: "Моноширинный",
            Image: "Картинка",
          },
          tools: {
            warning: {
              Title: "Название",
              Message: "Сообщение",
            },
            link: {
              "Add a link": "Вставьте ссылку",
            },
            stub: {
              "The block can not be displayed correctly.":
                "Блок не может быть отображен",
            },
            image: {
              Caption: "Подпись",
              "Select an Image": "Выберите файл",
              "With border": "Добавить рамку",
              "Stretch image": "Растянуть",
              "With background": "Добавить подложку",
            },
            code: {
              "Enter a code": "Код",
            },
            linkTool: {
              Link: "Ссылка",
              "Couldn't fetch the link data": "Не удалось получить данные",
              "Couldn't get this link data, try the other one":
                "Не удалось получить данные по ссылке, попробуйте другую",
              "Wrong response format from the server": "Неполадки на сервере",
            },
            header: {
              Header: "Заголовок",
            },
            paragraph: {
              "Enter something": "Введите текст",
            },
            list: {
              Ordered: "Нумерованный",
              Unordered: "Маркированный",
            },
          },
          blockTunes: {
            delete: {
              Delete: "Удалить",
            },
            moveUp: {
              "Move up": "Переместить вверх",
            },
            moveDown: {
              "Move down": "Переместить вниз",
            },
          },
        },
      },
      data: {
        blocks: [
          {
            type: "header",
            data: {
              text: "Понтий Пилат",
              level: 2,
            },
          },
          {
            type: "paragraph",
            data: {
              text: "По́нтий Пила́т (лат. Pontius Pilatus, др.-греч. Πόντιος Πιλάτος; родился около 12 года до н. э., Апруций, Римская империя — умер после 37 года) — римский префект Иудеи c 26 по 36 год, из всаднического сословия. Корнелий Тацит называет его прокуратором Иудеи, Иосиф Флавий — правителем (игемоном) и наместником, однако найденная в 1961 году в Кесарии надпись, датируемая периодом правления Пилата, показывает, что он, как и другие римские правители Иудеи с 6 по 41 год, был в должности префекта.",
            },
          },
          // Additional blocks as needed
        ],
      },
    });

    window.editor = this.editor;
  }

  disconnect() {
    if (this.editor) {
      this.editor.destroy();
      this.editor = null;
    }
  }
}
