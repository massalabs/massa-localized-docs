# Massa Localized Docs

This repository contains the localized documentation for the Massa project. It is based on the documentation in [Massa Docs](https://github.com/massalabs/massa-docs) repository.

- `.pot` files are automatically updated every day at 00:00 UTC.
- `.po` files for every languages are automatically updated every day at 01:00 UTC.

## Contribute

### Prerequisites

In order to contribute to the documentation, you need to have `sphinx` installed on your computer. You can install it with `pip`:

```bash
python3 -m pip install -r requirements.txt
```

### How to translate the documentation

To translate the documentation, you need to make sure that the files for the language you want to translate are present in the `locales` folder. If they are not, you have to create an issue in this repository to ask for the addition of the language you want to translate.

If the files are present, you can clone this repository and start translating the documentation. You can find the `.po` files in the `locales/<language>/LC_MESSAGES` folder. You can edit them with any text editor.

Once you are done translating, you can submit a pull request to this repository. The pull request will be reviewed by the Massa team and merged if it is correct.

### How to add missing `msgid` in the `.po` files

If some `msgid` are missing in the `.po` files, it's probably because they have been added to the documentation since the last time the `.po` files were updated. To add the missing `msgid` to the `.po` files, you can run the following command:

```bash
sphinx-intl update -p build/locale -l <language>
```

Where `<language>` is the language you want to update. You can then commit the changes and submit a pull request.
