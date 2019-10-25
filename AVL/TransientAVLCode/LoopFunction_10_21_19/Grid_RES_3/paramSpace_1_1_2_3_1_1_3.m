function [aeroForces] = paramSpace_1_1_2_3_1_1_3(sailStates,airStates)

	CL = (4.008633)*sailStates.alpha + (-0.293980)*sailStates.beta + (-2.796275)*sailStates.p + (39.135471)*sailStates.q + (-1.497443)*sailStates.r + (0.011146)*sailStates.de;
	CD = -0.133410;
	CY = (-0.091652)*sailStates.alpha + (-0.024029)*sailStates.beta + (-0.450492)*sailStates.p + (-0.318252)*sailStates.q + (-0.079434)*sailStates.r + (-0.000068)*sailStates.de;

	Cl = (1.329660)*sailStates.alpha + (0.146285)*sailStates.beta + (-1.438597)*sailStates.p + (12.855834)*sailStates.q + (-1.190450)*sailStates.r + (0.000809)*sailStates.de;
	Cm = (-12.761110)*sailStates.alpha + (1.094534)*sailStates.beta + (8.848490)*sailStates.p + (-142.287766)*sailStates.q + (5.015499)*sailStates.r + (-0.068238)*sailStates.de;
	Cn = (0.325102)*sailStates.alpha + (0.039623)*sailStates.beta + (0.811168)*sailStates.p + (-2.546332)*sailStates.q + (-0.022150)*sailStates.r + (0.000014)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end