function [aeroForces] = paramSpace_2_2_2_3_3_1_2(sailStates,airStates)

	CL = (4.407336)*sailStates.alpha + (-0.083771)*sailStates.beta + (-2.578549)*sailStates.p + (35.785686)*sailStates.q + (-1.120530)*sailStates.r + (0.011182)*sailStates.de;
	CD = -0.248380;
	CY = (0.063703)*sailStates.alpha + (-0.025171)*sailStates.beta + (-0.471961)*sailStates.p + (0.498141)*sailStates.q + (-0.030952)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.444871)*sailStates.alpha + (0.191181)*sailStates.beta + (-1.226566)*sailStates.p + (10.203793)*sailStates.q + (-0.958553)*sailStates.r + (0.000376)*sailStates.de;
	Cm = (-14.500920)*sailStates.alpha + (0.327422)*sailStates.beta + (8.552820)*sailStates.p + (-136.960373)*sailStates.q + (3.801736)*sailStates.r + (-0.070040)*sailStates.de;
	Cn = (-0.144732)*sailStates.alpha + (0.014616)*sailStates.beta + (0.969486)*sailStates.p + (-4.488829)*sailStates.q + (0.005973)*sailStates.r + (-0.000218)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end