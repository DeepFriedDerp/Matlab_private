function [aeroForces] = paramSpace_1_1_1_3_2_3_3(sailStates,airStates)

	CL = (3.862520)*sailStates.alpha + (-0.061455)*sailStates.beta + (-2.693184)*sailStates.p + (35.118874)*sailStates.q + (-0.317071)*sailStates.r + (0.010215)*sailStates.de;
	CD = -0.044410;
	CY = (0.027612)*sailStates.alpha + (-0.025311)*sailStates.beta + (0.060240)*sailStates.p + (0.173374)*sailStates.q + (0.010605)*sailStates.r + (0.000037)*sailStates.de;

	Cl = (1.358923)*sailStates.alpha + (-0.058998)*sailStates.beta + (-1.401851)*sailStates.p + (11.786491)*sailStates.q + (-0.100457)*sailStates.r + (0.000780)*sailStates.de;
	Cm = (-14.148815)*sailStates.alpha + (0.257090)*sailStates.beta + (9.456307)*sailStates.p + (-141.665955)*sailStates.q + (1.130254)*sailStates.r + (-0.068173)*sailStates.de;
	Cn = (0.188826)*sailStates.alpha + (-0.011719)*sailStates.beta + (-0.375607)*sailStates.p + (2.532446)*sailStates.q + (-0.040522)*sailStates.r + (-0.000001)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end