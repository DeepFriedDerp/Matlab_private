function [aeroForces] = paramSpace_4_1_2_2_1_3_1(sailStates,airStates)

	CL = (4.718032)*sailStates.alpha + (0.436776)*sailStates.beta + (-2.129026)*sailStates.p + (35.413876)*sailStates.q + (2.035416)*sailStates.r + (0.011035)*sailStates.de;
	CD = -0.628500;
	CY = (-0.193229)*sailStates.alpha + (-0.026188)*sailStates.beta + (0.753905)*sailStates.p + (-0.455228)*sailStates.q + (-0.149945)*sailStates.r + (-0.000095)*sailStates.de;

	Cl = (1.469374)*sailStates.alpha + (-0.226217)*sailStates.beta + (-0.894085)*sailStates.p + (8.351945)*sailStates.q + (1.649873)*sailStates.r + (-0.000101)*sailStates.de;
	Cm = (-12.191164)*sailStates.alpha + (-1.594018)*sailStates.beta + (5.934820)*sailStates.p + (-121.885399)*sailStates.q + (-6.735690)*sailStates.r + (-0.065529)*sailStates.de;
	Cn = (0.626061)*sailStates.alpha + (0.075718)*sailStates.beta + (-1.569373)*sailStates.p + (6.975265)*sailStates.q + (0.019319)*sailStates.r + (0.000245)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end