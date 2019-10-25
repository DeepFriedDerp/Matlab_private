function [aeroForces] = paramSpace_2_3_1_2_2_3_2(sailStates,airStates)

	CL = (4.422251)*sailStates.alpha + (-0.044611)*sailStates.beta + (-2.539967)*sailStates.p + (33.786209)*sailStates.q + (0.662582)*sailStates.r + (0.010752)*sailStates.de;
	CD = -0.379780;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.378776)*sailStates.p + (0.000000)*sailStates.q + (0.024826)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.329840)*sailStates.alpha + (-0.203770)*sailStates.beta + (-1.183204)*sailStates.p + (9.266954)*sailStates.q + (0.680636)*sailStates.r + (0.000300)*sailStates.de;
	Cm = (-15.050854)*sailStates.alpha + (0.155213)*sailStates.beta + (8.975848)*sailStates.p + (-137.194580)*sailStates.q + (-2.214287)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (0.239655)*sailStates.alpha + (-0.011702)*sailStates.beta + (-0.934668)*sailStates.p + (4.601838)*sailStates.q + (-0.011798)*sailStates.r + (0.000097)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end