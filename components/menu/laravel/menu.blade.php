@props([
    'items',
    'label' => 'Mais ações',
    'menuId' => 'ciata-menu',
])

<div class="ciata-menu" data-ciata-menu>
    <button
        type="button"
        class="ciata-menu__trigger"
        aria-haspopup="menu"
        aria-expanded="false"
        aria-controls="{{ $menuId }}"
    >{{ $label }}</button>

    <div id="{{ $menuId }}" class="ciata-menu__popup" role="menu" hidden>
        @foreach($items as $item)
            <button
                type="button"
                class="ciata-menu__item"
                role="menuitem"
                @disabled($item['disabled'] ?? false)
                data-ciata-menu-item
            >{{ $item['label'] }}</button>
        @endforeach
    </div>
</div>
