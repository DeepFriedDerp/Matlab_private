function [aeroForces] = paramSpace_2_2_1_2_2_1_2(sailStates,airStates)

	CL = (5.416003)*sailStates.alpha + (-3.933330)*sailStates.beta + (-3.476626)*sailStates.p + (47.791664)*sailStates.q + (2.284738)*sailStates.r + (0.010548)*sailStates.de;
	CD = -6.300620;
	CY = (1.814106)*sailStates.alpha + (-0.249836)*sailStates.beta + (0.339227)*sailStates.p + (15.640940)*sailStates.q + (-0.035798)*sailStates.r + (0.002979)*sailStates.de;

	Cl = (-5.651015)*sailStates.alpha + (-1.274513)*sailStates.beta + (-1.690551)*sailStates.p + (14.409843)*sailStates.q + (2.516433)*sailStates.r + (0.001251)*sailStates.de;
	Cm = (6.216144)*sailStates.alpha + (17.658686)*sailStates.beta + (10.769408)*sailStates.p + (-152.020340)*sailStates.q + (-8.078916)*sailStates.r + (-0.055350)*sailStates.de;
	Cn = (-1.911198)*sailStates.alpha + (0.352571)*sailStates.beta + (-0.976958)*sailStates.p + (-8.518381)*sailStates.q + (-0.195182)*sailStates.r + (-0.003884)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end