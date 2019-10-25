function [aeroForces] = paramSpace_10_1_4_1_2_2_2(sailStates,airStates)

	CL = (4.457983)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.123232)*sailStates.p + (40.748230)*sailStates.q + (1.468646)*sailStates.r + (0.011598)*sailStates.de;
	CD = -0.611650;
	CY = (0.229699)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.572990)*sailStates.p + (0.839976)*sailStates.q + (-0.039979)*sailStates.r + (0.000183)*sailStates.de;

	Cl = (1.349205)*sailStates.alpha + (-0.320432)*sailStates.beta + (-1.642620)*sailStates.p + (14.081572)*sailStates.q + (1.329886)*sailStates.r + (0.001048)*sailStates.de;
	Cm = (-13.168770)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.266389)*sailStates.p + (-151.784744)*sailStates.q + (-5.021008)*sailStates.r + (-0.071706)*sailStates.de;
	Cn = (-0.511172)*sailStates.alpha + (0.022407)*sailStates.beta + (-1.193734)*sailStates.p + (4.284019)*sailStates.q + (-0.001957)*sailStates.r + (-0.000149)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end