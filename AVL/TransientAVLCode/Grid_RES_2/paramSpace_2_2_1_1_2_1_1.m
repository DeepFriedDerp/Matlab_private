function [aeroForces] = paramSpace_2_2_1_1_2_1_1(sailStates,airStates)

	CL = (5.532416)*sailStates.alpha + (-4.018402)*sailStates.beta + (-3.498553)*sailStates.p + (48.156467)*sailStates.q + (2.367239)*sailStates.r + (0.010603)*sailStates.de;
	CD = -6.599940;
	CY = (1.846476)*sailStates.alpha + (-0.251628)*sailStates.beta + (0.371984)*sailStates.p + (15.763751)*sailStates.q + (-0.040041)*sailStates.r + (0.003003)*sailStates.de;

	Cl = (-5.889718)*sailStates.alpha + (-1.314493)*sailStates.beta + (-1.705109)*sailStates.p + (14.580427)*sailStates.q + (2.596645)*sailStates.r + (0.001273)*sailStates.de;
	Cm = (6.907946)*sailStates.alpha + (17.995218)*sailStates.beta + (10.794257)*sailStates.p + (-152.519012)*sailStates.q + (-8.357595)*sailStates.r + (-0.055406)*sailStates.de;
	Cn = (-1.976108)*sailStates.alpha + (0.356179)*sailStates.beta + (-1.052959)*sailStates.p + (-8.274328)*sailStates.q + (-0.195620)*sailStates.r + (-0.003907)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end