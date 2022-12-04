import { useState } from 'react';
import {ethers, BigNumber} from 'ethers';
import { Box,  Flex, Button, Text, Image } from '@chakra-ui/react';
import ExampleNFT from './ExampleNFT.json';

const ExampleNFTAddress = "0x1CAe00F6B983966F610f7a5f1FE2027E8642C3c5";

const MainMint = ({ accounts, setAccounts }) => {
    const[mintAmount, setMintAmount] = useState(1);
    const isConnected = Boolean(accounts[0]);

    async function handleMintOne() {
        if (window.ethereum) {
            const provider = new ethers.providers.Web3Provider(window.ethereum);
            const signer = provider.getSigner();
            const contract = new ethers.Contract(
                ExampleNFTAddress,
                ExampleNFT.abi,
                signer
            );
            try {
                const response = await contract.mintOne(BigNumber.from(mintAmount), {
                    value: ethers.utils.parseEther((0.001 * mintAmount).toString()),
                });
                console.log('response: ', response);
            } catch (err) {
                console.log("error: ", err)
            }
        }
    }

    async function handleMintTwo() {
        if (window.ethereum) {
            const provider = new ethers.providers.Web3Provider(window.ethereum);
            const signer = provider.getSigner();
            const contract = new ethers.Contract(
                ExampleNFTAddress,
                ExampleNFT.abi,
                signer
            );
            try {
                const response = await contract.mintTwo(BigNumber.from(mintAmount), {
                    value: ethers.utils.parseEther((0.001 * mintAmount).toString()),
                });
                console.log('response: ', response);
            } catch (err) {
                console.log("error: ", err)
            }
        }
    }

    async function handleMintThree() {
        if (window.ethereum) {
            const provider = new ethers.providers.Web3Provider(window.ethereum);
            const signer = provider.getSigner();
            const contract = new ethers.Contract(
                ExampleNFTAddress,
                ExampleNFT.abi,
                signer
            );
            try {
                const response = await contract.mintThree(BigNumber.from(mintAmount), {
                    value: ethers.utils.parseEther((0.001 * mintAmount).toString()),
                });
                console.log('response: ', response);
            } catch (err) {
                console.log("error: ", err)
            }
        }
    }

    async function handleMintFour() {
        if (window.ethereum) {
            const provider = new ethers.providers.Web3Provider(window.ethereum);
            const signer = provider.getSigner();
            const contract = new ethers.Contract(
                ExampleNFTAddress,
                ExampleNFT.abi,
                signer
            );
            try {
                const response = await contract.mintFour(BigNumber.from(mintAmount), {
                    value: ethers.utils.parseEther((0.001 * mintAmount).toString()),
                });
                console.log('response: ', response);
            } catch (err) {
                console.log("error: ", err)
            }
        }
    }

    return (
        <Flex justify='center' align='center' height="50vh" paddingBottom='150px' >
            <Box width='1000px'>
                <div>
                    <Image src="https://gateway.pinata.cloud/ipfs/QmV61wWswuVsome2PQbfNPHZ912aBi7vUjn7wTg8yyaMQC/1.png" width="80%" marginTop="500px" borderRadius="10%">

                    </Image>
                    <Text fontSize="20px" textShadow="0 5px #00000" color="black">
                        ExampleNFT #1
                    </Text>
                  
                    {/* <Text 
                        fontSize="30px" 
                        fontFamily="inherit" 
                        textShadow="0 2px 2px #00000"
                        color="black">
                        Testing 1, 2, 3, 4
                    </Text> */}
                </div>

                {isConnected ? (
                    <div>
                        <div>
                            <Text
                                readyOnly 
                                fontFamily="inherit" 
                                // width="85px" 
                                // height="40px" 
                                textAlign="center" 
                                // paddingLeft="19px" 
                                // marginTop="10px" 
                                fontSize="30px" 
                                type="number">
                                
                                {mintAmount} / 10

                            </Text> 
                        </div>
                            <Button 
                                backgroundColor="#0E0D0B"
                                borderRadius="5px"
                                boxShadow="0px 2px 2px 1px #0F0F0F"
                                color="inherit"
                                cursor="pointer"
                                fontFamily="inherit"
                                padding="15px"
                                // marginTop="10px"
                                fontSize="20px" 
                                onClick={handleMintOne}>
                                Mint Now
                            </Button>
                    </div>

                    
                ) : (
                    <Text 
                        marginTop="50px"
                        fontSize="30px"
                        fontFamily="inherit"
                        textShadow="0 3px #000000"
                        color='black'>
                        {/* You must be connected to Mint. */}
                    </Text>
                )}
            </Box>
            <Box width='1000px'>
                <div>
                    <Image src="https://gateway.pinata.cloud/ipfs/QmV61wWswuVsome2PQbfNPHZ912aBi7vUjn7wTg8yyaMQC/2.png" width="80%" marginTop="500px" borderRadius="10%">

                    </Image>
                    <Text fontSize="20px" textShadow="0 5px #00000" color="black">
                    ExampleNFT #2
                    </Text>
                    {/* <Text 
                        fontSize="30px" 
                        fontFamily="inherit" 
                        textShadow="0 2px 2px #00000"
                        color="black">
                        Testing 1, 2, 3, 4
                    </Text> */}
                </div>

                {isConnected ? (
                    <div>
                        <div>
                            <Text
                                readyOnly 
                                fontFamily="inherit" 
                                // width="85px" 
                                // height="40px" 
                                textAlign="center" 
                                // paddingLeft="19px" 
                                // marginTop="10px" 
                                fontSize="30px" 
                                type="number">
                                
                                {mintAmount} / 10

                            </Text> 
                        </div>
                            <Button 
                                backgroundColor="#0E0D0B"
                                borderRadius="5px"
                                boxShadow="0px 2px 2px 1px #0F0F0F"
                                color="inherit"
                                cursor="pointer"
                                fontFamily="inherit"
                                padding="15px"
                                // marginTop="10px"
                                fontSize="20px" 
                                onClick={handleMintTwo}>
                                Mint Now
                            </Button>
                    </div>

                    
                ) : (
                    <Text 
                        marginTop="50px"
                        fontSize="30px"
                        fontFamily="inherit"
                        textShadow="0 3px #000000"
                        color='black'>
                        {/* You must be connected to Mint. */}
                    </Text>
                )}
            </Box>

            <Box width='1000px'>
                <div>
                    <Image src="https://gateway.pinata.cloud/ipfs/QmV61wWswuVsome2PQbfNPHZ912aBi7vUjn7wTg8yyaMQC/3.png" width="80%" marginTop="500px" borderRadius="10%">

                    </Image>
                    <Text fontSize="20px" textShadow="0 5px #00000" color="black">
                        ExampleNFT #3
                    </Text>
                    {/* <Text 
                        fontSize="30px" 
                        fontFamily="inherit" 
                        textShadow="0 2px 2px #00000"
                        color="black">
                        Testing 1, 2, 3, 4
                    </Text> */}
                </div>

                {isConnected ? (
                    <div>
                        <div>
                            <Text
                                readyOnly 
                                fontFamily="inherit" 
                                // width="85px" 
                                // height="40px" 
                                textAlign="center" 
                                // paddingLeft="19px" 
                                // marginTop="10px" 
                                fontSize="30px" 
                                type="number">
                                
                                {mintAmount} / 10

                            </Text> 
                        </div>
                            <Button 
                                backgroundColor="#0E0D0B"
                                borderRadius="5px"
                                boxShadow="0px 2px 2px 1px #0F0F0F"
                                color="inherit"
                                cursor="pointer"
                                fontFamily="inherit"
                                padding="15px"
                                // marginTop="10px"
                                fontSize="20px" 
                                onClick={handleMintThree}>
                                Mint Now
                            </Button>
                    </div>

                    
                ) : (
                    <Text 
                        marginTop="50px"
                        fontSize="30px"
                        fontFamily="inherit"
                        textShadow="0 3px #000000"
                        color='black'>
                        {/* You must be connected to Mint. */}
                    </Text>
                )}
            </Box>

            <Box width='1000px'>
                <div>
                    <Image src="https://gateway.pinata.cloud/ipfs/QmV61wWswuVsome2PQbfNPHZ912aBi7vUjn7wTg8yyaMQC/4.png" width="80%" marginTop="500px" borderRadius="10%">

                    </Image>
                    <Text fontSize="20px" textShadow="0 5px #00000" color="black">
                        ExampleNFT #4
                    </Text>
                    
                    {/* <Text 
                        fontSize="30px" 
                        fontFamily="inherit" 
                        textShadow="0 2px 2px #00000"
                        color="black">
                        Testing 1, 2, 3, 4
                    </Text> */}
                </div>

                {isConnected ? (
                    <div>
                        <div>
                            <Text
                                readyOnly 
                                fontFamily="inherit" 
                                // width="85px" 
                                // height="40px" 
                                textAlign="center" 
                                // paddingLeft="19px" 
                                // marginTop="10px" 
                                fontSize="30px" 
                                type="number">
                                
                                {mintAmount} / 10

                            </Text> 
                        </div>
                            <Button 
                                backgroundColor="#0E0D0B"
                                borderRadius="5px"
                                boxShadow="0px 2px 2px 1px #0F0F0F"
                                color="inherit"
                                cursor="pointer"
                                fontFamily="inherit"
                                padding="15px"
                                // marginTop="10px"
                                fontSize="20px" 
                                onClick={handleMintFour}>
                                Mint Now
                            </Button>
                    </div>

                    
                ) : (
                    <Text 
                        marginTop="50px"
                        fontSize="30px"
                        fontFamily="inherit"
                        textShadow="0 3px #000000"
                        color='black'>
                        {/* You must be connected to Mint. */}
                    </Text>
                )}
            </Box>
        </Flex>
    );


};

export default MainMint;

