
@('rg', './rg', 'rg.exe', '.\rg', '.\rg.exe', './rg.exe') | %{
    Register-ArgumentCompleter -Native -CommandName $_ -ScriptBlock {
        param($wordToComplete, $commandAst, $cursorPosition)

        $command = '_rg'
        $commandAst.CommandElements |
            Select-Object -Skip 1 |
            %{
                switch ($_.ToString()) {

                    'ripgrep' {
                        $command += '_ripgrep'
                        break
                    }

                    default { 
                        break
                    }
                }
            }

        $completions = @()

        switch ($command) {

            '_rg' {
                $completions = @('-s', '-c', '-l', '-F', '-L', '-i', '-v', '-n', '-N', '-x', '-0', '-o', '-p', '-q', '-z', '-S', '-a', '-u', '-H', '-w', '-h', '-V', '-A', '-B', '-C', '-E', '-f', '-g', '-M', '-m', '-e', '-r', '-j', '-t', '-T', '--case-sensitive', '--column', '--count', '--debug', '--files', '--files-with-matches', '--files-without-match', '--fixed-strings', '--follow', '--no-follow', '--heading', '--no-heading', '--hidden', '--no-hidden', '--ignore-case', '--invert-match', '--line-number', '--no-line-number', '--line-regexp', '--mmap', '--no-mmap', '--no-config', '--no-ignore', '--ignore', '--no-ignore-parent', '--ignore-parent', '--no-ignore-vcs', '--ignore-vcs', '--no-messages', '--messages', '--null', '--only-matching', '--passthru', '--pretty', '--quiet', '--search-zip', '--no-search-zip', '--smart-case', '--sort-files', '--no-sort-files', '--text', '--no-text', '--type-list', '--unrestricted', '--vimgrep', '--with-filename', '--no-filename', '--word-regexp', '--help', '--version', '--after-context', '--before-context', '--color', '--colors', '--context', '--context-separator', '--dfa-size-limit', '--encoding', '--file', '--glob', '--iglob', '--ignore-file', '--line-number-width', '--max-columns', '--max-count', '--max-filesize', '--maxdepth', '--path-separator', '--regex-size-limit', '--regexp', '--replace', '--threads', '--type', '--type-add', '--type-clear', '--type-not')
            }

        }

        $completions |
            ?{ $_ -like "$wordToComplete*" } |
            Sort-Object |
            %{ New-Object System.Management.Automation.CompletionResult $_, $_, 'ParameterValue', $_ }
    }
}
