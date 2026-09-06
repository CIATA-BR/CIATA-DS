@props([
    'items',
    'menuId',
    'label' => 'Mais ações',
])

@php
    $normalizedMenuId = trim((string) $menuId);
    $normalizedLabel = trim((string) $label);
    $normalizedItems = collect($items)->values()->map(function ($item) {
        if (!is_array($item) || !array_key_exists('label', $item)) {
            throw new InvalidArgumentException('Cada item deve conter label.');
        }

        $item['label'] = trim((string) $item['label']);
        if ($item['label'] === '') {
            throw new InvalidArgumentException('Rótulos de itens não podem ser vazios.');
        }
        $item['disabled'] = (bool) ($item['disabled'] ?? false);

        return $item;
    });

    if ($normalizedMenuId === '') {
        throw new InvalidArgumentException('menuId não pode ser vazio.');
    }
    if ($normalizedLabel === '') {
        throw new InvalidArgumentException('label não pode ser vazio.');
    }
    if ($normalizedItems->isEmpty()) {
        throw new InvalidArgumentException('items não pode ser vazio.');
    }
@endphp

<div class="ciata-menu" data-ciata-menu>
    <button
        type="button"
        class="ciata-menu__trigger"
        aria-haspopup="menu"
        aria-expanded="false"
        aria-controls="{{ $normalizedMenuId }}"
    >{{ $normalizedLabel }}</button>

    <div id="{{ $normalizedMenuId }}" class="ciata-menu__popup" role="menu" hidden>
        @foreach($normalizedItems as $item)
            <button
                type="button"
                class="ciata-menu__item"
                role="menuitem"
                @disabled($item['disabled'])
                data-ciata-menu-item
            >{{ $item['label'] }}</button>
        @endforeach
    </div>
</div>
