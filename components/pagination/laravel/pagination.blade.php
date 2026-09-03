@props([
    'currentPage',
    'totalPages',
    'hrefForPage',
    'label' => 'Paginação',
])

<nav aria-label="{{ $label }}">
    <div class="ciata-pagination">
        @if($currentPage > 1)
            <a href="{{ $hrefForPage($currentPage - 1) }}" aria-label="Página anterior">Anterior</a>
        @endif

        @for($page = 1; $page <= $totalPages; $page++)
            <a
                href="{{ $hrefForPage($page) }}"
                aria-label="Página {{ $page }}"
                @if($page === $currentPage) aria-current="page" @endif
            >{{ $page }}</a>
        @endfor

        @if($currentPage < $totalPages)
            <a href="{{ $hrefForPage($currentPage + 1) }}" aria-label="Próxima página">Próxima</a>
        @endif
    </div>
</nav>
