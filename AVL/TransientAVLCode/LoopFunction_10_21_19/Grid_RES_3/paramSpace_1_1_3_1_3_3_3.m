function [aeroForces] = paramSpace_1_1_3_1_3_3_3(sailStates,airStates)

	CL = (4.917188)*sailStates.alpha + (0.235668)*sailStates.beta + (-3.150661)*sailStates.p + (35.372360)*sailStates.q + (0.647392)*sailStates.r + (0.009738)*sailStates.de;
	CD = -1.551790;
	CY = (0.443327)*sailStates.alpha + (-0.029968)*sailStates.beta + (0.498131)*sailStates.p + (2.260753)*sailStates.q + (0.088049)*sailStates.r + (0.000485)*sailStates.de;

	Cl = (1.340738)*sailStates.alpha + (-0.306807)*sailStates.beta + (-1.839046)*sailStates.p + (15.292381)*sailStates.q + (0.908025)*sailStates.r + (0.001493)*sailStates.de;
	Cm = (-14.318964)*sailStates.alpha + (-1.056482)*sailStates.beta + (11.874010)*sailStates.p + (-156.476898)*sailStates.q + (-2.145885)*sailStates.r + (-0.069804)*sailStates.de;
	Cn = (-0.687193)*sailStates.alpha + (-0.065320)*sailStates.beta + (-1.485037)*sailStates.p + (6.128993)*sailStates.q + (-0.045213)*sailStates.r + (-0.000523)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end