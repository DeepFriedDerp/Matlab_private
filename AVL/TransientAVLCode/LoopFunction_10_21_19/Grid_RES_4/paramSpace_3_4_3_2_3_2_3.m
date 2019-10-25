function [aeroForces] = paramSpace_3_4_3_2_3_2_3(sailStates,airStates)

	CL = (3.906618)*sailStates.alpha + (-0.059326)*sailStates.beta + (-2.956930)*sailStates.p + (37.927307)*sailStates.q + (0.187462)*sailStates.r + (0.011060)*sailStates.de;
	CD = 0.029760;
	CY = (0.078231)*sailStates.alpha + (-0.025570)*sailStates.beta + (-0.025558)*sailStates.p + (0.668511)*sailStates.q + (0.001699)*sailStates.r + (0.000144)*sailStates.de;

	Cl = (1.285225)*sailStates.alpha + (-0.027247)*sailStates.beta + (-1.483308)*sailStates.p + (12.143644)*sailStates.q + (0.114738)*sailStates.r + (0.000756)*sailStates.de;
	Cm = (-14.178914)*sailStates.alpha + (0.248958)*sailStates.beta + (10.119216)*sailStates.p + (-147.557632)*sailStates.q + (-0.654757)*sailStates.r + (-0.070199)*sailStates.de;
	Cn = (-0.151370)*sailStates.alpha + (0.002542)*sailStates.beta + (0.128247)*sailStates.p + (-1.425035)*sailStates.q + (-0.009619)*sailStates.r + (-0.000207)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end