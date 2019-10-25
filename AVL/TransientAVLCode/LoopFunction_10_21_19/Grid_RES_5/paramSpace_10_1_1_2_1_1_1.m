function [aeroForces] = paramSpace_10_1_1_2_1_1_1(sailStates,airStates)

	CL = (4.135857)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.334720)*sailStates.p + (32.585583)*sailStates.q + (-0.116761)*sailStates.r + (0.010863)*sailStates.de;
	CD = -0.070500;
	CY = (-0.031245)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.138434)*sailStates.p + (-0.351850)*sailStates.q + (0.009717)*sailStates.r + (-0.000076)*sailStates.de;

	Cl = (1.137931)*sailStates.alpha + (0.083435)*sailStates.beta + (-1.026377)*sailStates.p + (8.000844)*sailStates.q + (-0.231148)*sailStates.r + (0.000053)*sailStates.de;
	Cm = (-14.976585)*sailStates.alpha + (0.000000)*sailStates.beta + (8.123287)*sailStates.p + (-131.203201)*sailStates.q + (0.429439)*sailStates.r + (-0.069551)*sailStates.de;
	Cn = (-0.127101)*sailStates.alpha + (-0.005834)*sailStates.beta + (0.364887)*sailStates.p + (-1.453418)*sailStates.q + (-0.004691)*sailStates.r + (0.000085)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end