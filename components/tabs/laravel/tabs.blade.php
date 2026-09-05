@props([
    'id',
    'tabs',
    'selectedIndex' => 0,
    'label' => 'Seções',
])

<div class="ciata-tabs" data-ciata-tabs>
    <div class="ciata-tabs__list" role="tablist" aria-label="{{ $label }}">
        @foreach($tabs as $index => $tab)
            <button
                type="button"
                id="{{ $id }}-tab-{{ $index }}"
                class="ciata-tabs__tab"
                role="tab"
                aria-selected="{{ $index === $selectedIndex ? 'true' : 'false' }}"
                aria-controls="{{ $id }}-panel-{{ $index }}"
                tabindex="{{ $index === $selectedIndex ? '0' : '-1' }}"
            >{{ $tab['label'] }}</button>
        @endforeach
    </div>

    @foreach($tabs as $index => $tab)
        <div
            id="{{ $id }}-panel-{{ $index }}"
            class="ciata-tabs__panel"
            role="tabpanel"
            aria-labelledby="{{ $id }}-tab-{{ $index }}"
            @if($index !== $selectedIndex) hidden @endif
        >{{ $tab['content'] }}</div>
    @endforeach
</div>
