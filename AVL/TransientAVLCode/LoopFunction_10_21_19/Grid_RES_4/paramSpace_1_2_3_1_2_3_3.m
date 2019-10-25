function [aeroForces] = paramSpace_1_2_3_1_2_3_3(sailStates,airStates)

	CL = (5.415326)*sailStates.alpha + (0.093568)*sailStates.beta + (-3.162838)*sailStates.p + (34.589920)*sailStates.q + (0.927563)*sailStates.r + (0.009539)*sailStates.de;
	CD = -1.928170;
	CY = (0.341812)*sailStates.alpha + (-0.025657)*sailStates.beta + (0.712454)*sailStates.p + (0.662186)*sailStates.q + (0.141740)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (1.785508)*sailStates.alpha + (-0.365154)*sailStates.beta + (-1.824848)*sailStates.p + (14.747003)*sailStates.q + (1.139466)*sailStates.r + (0.001522)*sailStates.de;
	Cm = (-15.162046)*sailStates.alpha + (-0.389693)*sailStates.beta + (12.401901)*sailStates.p + (-158.727341)*sailStates.q + (-2.977617)*sailStates.r + (-0.070277)*sailStates.de;
	Cn = (-0.630852)*sailStates.alpha + (-0.080867)*sailStates.beta + (-1.973479)*sailStates.p + (9.719104)*sailStates.q + (-0.093799)*sailStates.r + (-0.000013)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end