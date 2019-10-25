function [aeroForces] = paramSpace_3_2_4_2_2_1_2(sailStates,airStates)

	CL = (4.422251)*sailStates.alpha + (-0.044611)*sailStates.beta + (-2.539967)*sailStates.p + (33.786209)*sailStates.q + (-0.662582)*sailStates.r + (0.010752)*sailStates.de;
	CD = -0.379780;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.378776)*sailStates.p + (-0.000000)*sailStates.q + (0.024826)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.381178)*sailStates.alpha + (0.174833)*sailStates.beta + (-1.215849)*sailStates.p + (9.670827)*sailStates.q + (-0.678454)*sailStates.r + (0.000388)*sailStates.de;
	Cm = (-15.050854)*sailStates.alpha + (0.155213)*sailStates.beta + (8.975848)*sailStates.p + (-137.194580)*sailStates.q + (2.214287)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (-0.226427)*sailStates.alpha + (-0.013113)*sailStates.beta + (0.936808)*sailStates.p + (-4.628309)*sailStates.q + (-0.011941)*sailStates.r + (-0.000097)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end