function [aeroForces] = paramSpace_4_2_2_3_1_3_1(sailStates,airStates)

	CL = (4.326856)*sailStates.alpha + (0.117787)*sailStates.beta + (-2.265265)*sailStates.p + (35.530933)*sailStates.q + (1.668117)*sailStates.r + (0.011016)*sailStates.de;
	CD = -0.252510;
	CY = (-0.102921)*sailStates.alpha + (-0.025280)*sailStates.beta + (0.564396)*sailStates.p + (-0.294837)*sailStates.q + (-0.112255)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.308529)*sailStates.alpha + (-0.234823)*sailStates.beta + (-0.980046)*sailStates.p + (8.762965)*sailStates.q + (1.302456)*sailStates.r + (0.000012)*sailStates.de;
	Cm = (-12.902097)*sailStates.alpha + (-0.425224)*sailStates.beta + (6.766475)*sailStates.p + (-127.124184)*sailStates.q + (-5.534336)*sailStates.r + (-0.066937)*sailStates.de;
	Cn = (0.305199)*sailStates.alpha + (0.054490)*sailStates.beta + (-1.124504)*sailStates.p + (4.790454)*sailStates.q + (0.003339)*sailStates.r + (0.000173)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end