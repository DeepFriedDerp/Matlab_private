function [aeroForces] = paramSpace_4_1_1_2_3_1_2(sailStates,airStates)

	CL = (4.319071)*sailStates.alpha + (-0.090774)*sailStates.beta + (-2.407460)*sailStates.p + (31.214264)*sailStates.q + (-0.250175)*sailStates.r + (0.009900)*sailStates.de;
	CD = -0.445260;
	CY = (0.085817)*sailStates.alpha + (-0.022615)*sailStates.beta + (-0.390430)*sailStates.p + (0.756269)*sailStates.q + (0.077580)*sailStates.r + (0.000159)*sailStates.de;

	Cl = (1.442807)*sailStates.alpha + (0.148464)*sailStates.beta + (-1.191439)*sailStates.p + (9.431551)*sailStates.q + (-0.460951)*sailStates.r + (0.000505)*sailStates.de;
	Cm = (-15.489198)*sailStates.alpha + (0.458435)*sailStates.beta + (9.051624)*sailStates.p + (-134.899979)*sailStates.q + (0.771740)*sailStates.r + (-0.066768)*sailStates.de;
	Cn = (-0.425522)*sailStates.alpha + (-0.043405)*sailStates.beta + (1.055660)*sailStates.p + (-5.961281)*sailStates.q + (-0.071370)*sailStates.r + (-0.000281)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end