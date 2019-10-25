function [aeroForces] = paramSpace_3_2_2_3_1_1_1(sailStates,airStates)

	CL = (4.146678)*sailStates.alpha + (-0.026683)*sailStates.beta + (-2.284496)*sailStates.p + (32.098980)*sailStates.q + (-0.227177)*sailStates.r + (0.010776)*sailStates.de;
	CD = -0.115930;
	CY = (-0.035038)*sailStates.alpha + (-0.025115)*sailStates.beta + (-0.170188)*sailStates.p + (-0.432842)*sailStates.q + (0.011170)*sailStates.r + (-0.000093)*sailStates.de;

	Cl = (1.134278)*sailStates.alpha + (0.097237)*sailStates.beta + (-1.003329)*sailStates.p + (7.818003)*sailStates.q + (-0.314216)*sailStates.r + (0.000035)*sailStates.de;
	Cm = (-14.874571)*sailStates.alpha + (0.122585)*sailStates.beta + (7.977233)*sailStates.p + (-129.813766)*sailStates.q + (0.785342)*sailStates.r + (-0.069334)*sailStates.de;
	Cn = (-0.158687)*sailStates.alpha + (-0.006940)*sailStates.beta + (0.444946)*sailStates.p + (-1.831205)*sailStates.q + (-0.004322)*sailStates.r + (0.000092)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end