function [aeroForces] = paramSpace_1_1_1_1_3_2_3(sailStates,airStates)

	CL = (-2.113120)*sailStates.alpha + (0.130555)*sailStates.beta + (-7.033771)*sailStates.p + (65.260201)*sailStates.q + (0.531998)*sailStates.r + (0.011726)*sailStates.de;
	CD = -3.559960;
	CY = (1.842274)*sailStates.alpha + (-0.030185)*sailStates.beta + (0.683123)*sailStates.p + (3.772588)*sailStates.q + (0.120094)*sailStates.r + (0.000872)*sailStates.de;

	Cl = (-3.824859)*sailStates.alpha + (-0.501398)*sailStates.beta + (-5.027035)*sailStates.p + (44.804268)*sailStates.q + (0.889003)*sailStates.r + (0.007238)*sailStates.de;
	Cm = (18.417793)*sailStates.alpha + (-0.538764)*sailStates.beta + (25.563601)*sailStates.p + (-267.731567)*sailStates.q + (-1.627173)*sailStates.r + (-0.087750)*sailStates.de;
	Cn = (-7.804076)*sailStates.alpha + (-0.095473)*sailStates.beta + (-2.547660)*sailStates.p + (12.771725)*sailStates.q + (-0.135772)*sailStates.r + (-0.000688)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end