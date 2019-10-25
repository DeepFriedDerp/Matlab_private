function [aeroForces] = paramSpace_2_4_3_2_2_1_3(sailStates,airStates)

	CL = (4.455987)*sailStates.alpha + (0.300778)*sailStates.beta + (-2.975801)*sailStates.p + (39.160873)*sailStates.q + (-1.388237)*sailStates.r + (0.011331)*sailStates.de;
	CD = -0.473620;
	CY = (-0.080763)*sailStates.alpha + (-0.024689)*sailStates.beta + (-0.560716)*sailStates.p + (0.100923)*sailStates.q + (-0.036748)*sailStates.r + (0.000022)*sailStates.de;

	Cl = (1.442793)*sailStates.alpha + (0.364944)*sailStates.beta + (-1.486949)*sailStates.p + (12.475180)*sailStates.q + (-1.198993)*sailStates.r + (0.000739)*sailStates.de;
	Cm = (-13.800309)*sailStates.alpha + (-1.129763)*sailStates.beta + (9.810248)*sailStates.p + (-147.195892)*sailStates.q + (4.691989)*sailStates.r + (-0.070159)*sailStates.de;
	Cn = (0.213716)*sailStates.alpha + (0.016806)*sailStates.beta + (1.175808)*sailStates.p + (-5.155942)*sailStates.q + (0.004845)*sailStates.r + (-0.000144)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end