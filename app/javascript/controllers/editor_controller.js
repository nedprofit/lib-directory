import EditorJS from '@editorjs/editorjs';
import Table from '@editorjs/table'
import Paragraph from '@editorjs/paragraph';
import Header from 'editorjs-header-with-anchor';
import {Controller} from "@hotwired/stimulus"

export default class extends Controller {

    static targets = ["html"]

    connect() {
        console.log(this.htmlTarget.innerHTML)

        var editor = new EditorJS({
            // Other configuration properties
            holder: 'editorjs',
            autofocus: true,
            tools: {
                table: {
                    class: Table,
                    inlineToolbar: true,
                    config: {withHeadings: true}
                },
                paragraph: {
                    class: Paragraph,
                    inlineToolbar: true,
                },
                header: {
                    class: Header,
                    inlineToolbar: true,
                },
            },
            onReady: async () => {
                await editor.blocks.renderFromHTML(this.htmlTarget.innerHTML);
            },
        });
    }
}