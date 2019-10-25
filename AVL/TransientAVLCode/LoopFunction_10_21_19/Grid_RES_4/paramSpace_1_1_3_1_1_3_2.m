function [aeroForces] = paramSpace_1_1_3_1_1_3_2(sailStates,airStates)

	CL = (6.639015)*sailStates.alpha + (0.387693)*sailStates.beta + (-2.340747)*sailStates.p + (26.783140)*sailStates.q + (1.703459)*sailStates.r + (0.008965)*sailStates.de;
	CD = -2.587100;
	CY = (-0.163131)*sailStates.alpha + (-0.019662)*sailStates.beta + (1.083729)*sailStates.p + (-1.664521)*sailStates.q + (0.215508)*sailStates.r + (-0.000351)*sailStates.de;

	Cl = (2.488676)*sailStates.alpha + (-0.361866)*sailStates.beta + (-1.178400)*sailStates.p + (8.243284)*sailStates.q + (1.768421)*sailStates.r + (0.000566)*sailStates.de;
	Cm = (-18.210699)*sailStates.alpha + (-1.523846)*sailStates.beta + (10.156759)*sailStates.p + (-136.195908)*sailStates.q + (-5.514895)*sailStates.r + (-0.066898)*sailStates.de;
	Cn = (0.827456)*sailStates.alpha + (-0.114355)*sailStates.beta + (-2.620302)*sailStates.p + (13.763743)*sailStates.q + (-0.122804)*sailStates.r + (0.000678)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end