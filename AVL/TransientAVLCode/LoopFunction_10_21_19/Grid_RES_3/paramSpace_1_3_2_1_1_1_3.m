function [aeroForces] = paramSpace_1_3_2_1_1_1_3(sailStates,airStates)

	CL = (5.066894)*sailStates.alpha + (0.610588)*sailStates.beta + (-3.541580)*sailStates.p + (49.061291)*sailStates.q + (-2.995745)*sailStates.r + (0.012486)*sailStates.de;
	CD = -1.870540;
	CY = (-0.554434)*sailStates.alpha + (-0.027557)*sailStates.beta + (-1.060596)*sailStates.p + (-1.081943)*sailStates.q + (-0.187012)*sailStates.r + (-0.000233)*sailStates.de;

	Cl = (1.115910)*sailStates.alpha + (0.749417)*sailStates.beta + (-1.904865)*sailStates.p + (17.807207)*sailStates.q + (-2.577065)*sailStates.r + (0.001467)*sailStates.de;
	Cm = (-8.926205)*sailStates.alpha + (-2.319058)*sailStates.beta + (10.258103)*sailStates.p + (-160.704956)*sailStates.q + (9.997267)*sailStates.r + (-0.070299)*sailStates.de;
	Cn = (1.678028)*sailStates.alpha + (0.101102)*sailStates.beta + (2.141897)*sailStates.p + (-7.634292)*sailStates.q + (-0.017507)*sailStates.r + (0.000078)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end