function [aeroForces] = paramSpace_3_3_3_1_1_2_3(sailStates,airStates)

	CL = (3.937832)*sailStates.alpha + (-0.052781)*sailStates.beta + (-3.434150)*sailStates.p + (42.238731)*sailStates.q + (0.897041)*sailStates.r + (0.011481)*sailStates.de;
	CD = -0.041790;
	CY = (-0.099556)*sailStates.alpha + (-0.024226)*sailStates.beta + (0.392892)*sailStates.p + (-1.915492)*sailStates.q + (-0.025819)*sailStates.r + (-0.000419)*sailStates.de;

	Cl = (1.561437)*sailStates.alpha + (-0.139640)*sailStates.beta + (-1.903738)*sailStates.p + (16.321028)*sailStates.q + (0.696170)*sailStates.r + (0.001446)*sailStates.de;
	Cm = (-13.869279)*sailStates.alpha + (0.195759)*sailStates.beta + (11.513693)*sailStates.p + (-160.694275)*sailStates.q + (-3.025432)*sailStates.r + (-0.072651)*sailStates.de;
	Cn = (-0.231187)*sailStates.alpha + (0.007063)*sailStates.beta + (-0.702568)*sailStates.p + (4.112922)*sailStates.q + (0.008666)*sailStates.r + (0.000612)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end