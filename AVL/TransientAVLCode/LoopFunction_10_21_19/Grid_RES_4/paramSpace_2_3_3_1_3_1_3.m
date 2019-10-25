function [aeroForces] = paramSpace_2_3_3_1_3_1_3(sailStates,airStates)

	CL = (7.345944)*sailStates.alpha + (0.218513)*sailStates.beta + (-3.492460)*sailStates.p + (44.881115)*sailStates.q + (-3.108964)*sailStates.r + (0.012056)*sailStates.de;
	CD = -2.988250;
	CY = (-0.266389)*sailStates.alpha + (-0.024361)*sailStates.beta + (-1.427686)*sailStates.p + (1.915495)*sailStates.q + (-0.093508)*sailStates.r + (0.000419)*sailStates.de;

	Cl = (3.026015)*sailStates.alpha + (0.704401)*sailStates.beta + (-1.922228)*sailStates.p + (17.022366)*sailStates.q + (-2.750472)*sailStates.r + (0.001446)*sailStates.de;
	Cm = (-14.465560)*sailStates.alpha + (-0.828363)*sailStates.beta + (11.023900)*sailStates.p + (-160.694275)*sailStates.q + (10.498229)*sailStates.r + (-0.072651)*sailStates.de;
	Cn = (1.452607)*sailStates.alpha + (0.039990)*sailStates.beta + (3.037776)*sailStates.p + (-14.813272)*sailStates.q + (0.026988)*sailStates.r + (-0.000862)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end