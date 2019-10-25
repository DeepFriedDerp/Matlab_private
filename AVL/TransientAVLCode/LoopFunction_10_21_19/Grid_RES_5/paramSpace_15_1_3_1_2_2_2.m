function [aeroForces] = paramSpace_15_1_3_1_2_2_2(sailStates,airStates)

	CL = (4.203782)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.064838)*sailStates.p + (45.238628)*sailStates.q + (2.535575)*sailStates.r + (0.011737)*sailStates.de;
	CD = -0.597410;
	CY = (0.245914)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.793337)*sailStates.p + (0.476204)*sailStates.q + (-0.197784)*sailStates.r + (0.000101)*sailStates.de;

	Cl = (1.226439)*sailStates.alpha + (-0.415382)*sailStates.beta + (-1.591841)*sailStates.p + (15.323586)*sailStates.q + (2.058890)*sailStates.r + (0.001050)*sailStates.de;
	Cm = (-10.098217)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.685228)*sailStates.p + (-148.858078)*sailStates.q + (-8.368060)*sailStates.r + (-0.067973)*sailStates.de;
	Cn = (-0.842934)*sailStates.alpha + (0.103566)*sailStates.beta + (-1.486512)*sailStates.p + (4.792037)*sailStates.q + (-0.043828)*sailStates.r + (0.000006)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end