<!DOCTYPE html>
<html lang="en">
{include 'file:chunks/main/head.tpl'}
<body>
	{include 'file:chunks/main/header.tpl'}
	<main>
		<div class="container">
			<h1>{if $_modx->resource.longtitle}{$_modx->resource.longtitle}{else}{$_modx->resource.pagetitle}{/if}</h1>
			<div class="search-result">
				<div class="search-result__item">
					<h2 class="main-heading text-left">Result #1</h2>
					<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Aliquid, optio fugiat incidunt iusto porro laudantium! Distinctio, ipsum voluptatem aliquam commodi nobis eum dolorem facilis explicabo numquam, necessitatibus dolores velit! Animi?</p>
					<a class="btn" href="#">Details</a>
				</div>
				<div class="search-result__item">
					<h2 class="main-heading text-left">Result #2</h2>
					<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Aliquid, optio fugiat incidunt iusto porro laudantium! Distinctio, ipsum voluptatem aliquam commodi nobis eum dolorem facilis explicabo numquam, necessitatibus dolores velit! Animi?</p>
					<a class="btn" href="#">Details</a>
				</div>
				<div class="search-result__item">
					<h2 class="main-heading text-left">Result #3</h2>
					<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Aliquid, optio fugiat incidunt iusto porro laudantium! Distinctio, ipsum voluptatem aliquam commodi nobis eum dolorem facilis explicabo numquam, necessitatibus dolores velit! Animi?</p>
					<a class="btn" href="#">Details</a>
				</div>
			</div>
		</div>
	</main>
	{include 'file:chunks/main/footer.tpl'}
</body>
</html>