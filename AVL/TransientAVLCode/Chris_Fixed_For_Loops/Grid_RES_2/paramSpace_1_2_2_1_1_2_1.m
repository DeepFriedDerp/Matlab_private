function [aeroForces] = paramSpace_1_2_2_1_1_2_1(sailStates,airStates)

	CL = (6.080529)*sailStates.alpha + (-0.867661)*sailStates.beta + (-6.084921)*sailStates.p + (55.212044)*sailStates.q + (2.675935)*sailStates.r + (0.011053)*sailStates.de;
	CD = -8.892720;
	CY = (2.931088)*sailStates.alpha + (-0.019313)*sailStates.beta + (1.516307)*sailStates.p + (4.244134)*sailStates.q + (0.200828)*sailStates.r + (0.000965)*sailStates.de;

	Cl = (-1.349735)*sailStates.alpha + (-1.085619)*sailStates.beta + (-4.188921)*sailStates.p + (35.908909)*sailStates.q + (2.903191)*sailStates.r + (0.005512)*sailStates.de;
	Cm = (7.628934)*sailStates.alpha + (3.753320)*sailStates.beta + (22.891434)*sailStates.p + (-240.006500)*sailStates.q + (-9.144201)*sailStates.r + (-0.082573)*sailStates.de;
	Cn = (-10.984072)*sailStates.alpha + (-0.107287)*sailStates.beta + (-4.043320)*sailStates.p + (17.139664)*sailStates.q + (-0.082219)*sailStates.r + (-0.000819)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end