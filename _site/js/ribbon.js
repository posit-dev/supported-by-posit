function addSupportedByPosit() {
    const header = document.getElementById('quarto-header');
    const navbarContainer = document.querySelector('.navbar-container.container-fluid');

    if (header && navbarContainer) {
        const headerHeight = header.offsetHeight;

        const styles = `
        #supported-by-posit {
            height: calc(${headerHeight}px + 20px);
            margin-top: -100px;
            margin-bottom: -100px;
            margin-left: 20px;
            width: 80px;
            order: 9999;
            background-color: #999999;
            box-shadow: 3px 3px 3px rgba(0, 0, 0, 0.3);

            will-change: transform;
            transition: transform 0.25s ease-in-out;
            transform: translateY(0);
        }

        .headroom--unpinned #supported-by-posit {
            transform: translateY(-15px);
        }
        
        body.quarto-dark #supported-by-posit {
            background-color: #333333;
        }

        #supported-by-posit:hover {
            background-color: #666666 !important;
        }
        `

        const styleElement = document.createElement('style');
        styleElement.textContent = styles;
        document.head.appendChild(styleElement);
        
        const supportedByPositElement = document.createElement('a');
        supportedByPositElement.setAttribute('aria-label', 'Supported by Posit');
        supportedByPositElement.href = 'https://posit.co';
        supportedByPositElement.id = 'supported-by-posit';
        supportedByPositElement.target = '_blank';
        supportedByPositElement.title = 'Supported by Posit';
        supportedByPositElement.classList.add('d-none', 'd-lg-block');

        navbarContainer.appendChild(supportedByPositElement);
    } else {
        console.error('Could not find required elements');
    }
}

document.addEventListener('DOMContentLoaded', addSupportedByPosit);
