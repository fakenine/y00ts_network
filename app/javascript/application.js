// Entry point for the build script in your package.json
import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = false

import * as bootstrap from "bootstrap"
import "@selectize/selectize"
import "./add_jquery"
import "./search"
