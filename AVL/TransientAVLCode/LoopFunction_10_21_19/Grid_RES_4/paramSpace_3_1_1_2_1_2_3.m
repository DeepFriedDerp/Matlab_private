function [aeroForces] = paramSpace_3_1_1_2_1_2_3(sailStates,airStates)

	CL = (3.993531)*sailStates.alpha + (0.071649)*sailStates.beta + (-2.942008)*sailStates.p + (37.979141)*sailStates.q + (0.570768)*sailStates.r + (0.011117)*sailStates.de;
	CD = 0.013620;
	CY = (-0.076649)*sailStates.alpha + (-0.025439)*sailStates.beta + (0.193313)*sailStates.p + (-0.870359)*sailStates.q + (-0.012579)*sailStates.r + (-0.000188)*sailStates.de;

	Cl = (1.472351)*sailStates.alpha + (-0.022808)*sailStates.beta + (-1.571636)*sailStates.p + (13.377586)*sailStates.q + (0.401166)*sailStates.r + (0.000982)*sailStates.de;
	Cm = (-14.368763)*sailStates.alpha + (-0.164411)*sailStates.beta + (9.949651)*sailStates.p + (-146.834122)*sailStates.q + (-1.888371)*sailStates.r + (-0.070120)*sailStates.de;
	Cn = (-0.035612)*sailStates.alpha + (0.004277)*sailStates.beta + (-0.332067)*sailStates.p + (1.928349)*sailStates.q + (0.001802)*sailStates.r + (0.000300)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end