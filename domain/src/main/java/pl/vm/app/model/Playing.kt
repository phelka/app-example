package pl.vm.app.model

import lombok.AllArgsConstructor
import lombok.Data

@Data
@AllArgsConstructor
class Playing {
    private val game: String? = null
    private val player: String? = null
}