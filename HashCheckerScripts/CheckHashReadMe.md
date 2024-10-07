Sure, here's a general guide on how to use the script:

1. Save the PowerShell script to a file. In the examples below, we'll assume that the script is saved as `CheckHash.ps1` in your Downloads folder.

2. Open a PowerShell window. You can do this by pressing `Win+R` to open the Run dialog, typing `powershell`, and pressing `Enter`.

3. Use the following command to run the script:

    ```powershell
    powershell -ExecutionPolicy Bypass -File path\to\CheckHash.ps1 -FilePath path\to\your\file -HashPath path\to\your\checksum -Algorithm hashAlgorithm
    ```

    Here, you should replace:

    - `path\to\CheckHash.ps1` with the path to the PowerShell script. For example, this might be `C:\Users\YourUsername\Downloads\CheckHash.ps1`.
    - `path\to\your\file` with the path to the file you want to check. For example, this might be `C:\Users\YourUsername\Downloads\yourfile.7z`.
    - `path\to\your\checksum` with the path to the checksum file. For example, this might be `C:\Users\YourUsername\Downloads\yourfile.7z.sha256`.
    - `hashAlgorithm` with the hash algorithm to use. This should be either `SHA256` or `SHA512`.

4. Press `Enter` to run the command. The script will calculate the hash of the specified file, compare it to the expected hash from the checksum file, and print the results.
