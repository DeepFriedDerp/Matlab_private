function [aeroForces] = paramSpace_3_4_3_1_2_1_1(sailStates,airStates)

	CL = (5.835393)*sailStates.alpha + (0.454515)*sailStates.beta + (-1.604370)*sailStates.p + (24.883959)*sailStates.q + (-2.003586)*sailStates.r + (0.009944)*sailStates.de;
	CD = -2.208450;
	CY = (0.394528)*sailStates.alpha + (-0.025046)*sailStates.beta + (-1.003530)*sailStates.p + (0.221997)*sailStates.q + (0.065783)*sailStates.r + (0.000047)*sailStates.de;

	Cl = (1.042527)*sailStates.alpha + (0.624067)*sailStates.beta + (-0.408903)*sailStates.p + (1.699729)*sailStates.q + (-1.938618)*sailStates.r + (-0.000928)*sailStates.de;
	Cm = (-14.670567)*sailStates.alpha + (-1.768973)*sailStates.beta + (6.228876)*sailStates.p + (-111.854546)*sailStates.q + (6.778191)*sailStates.r + (-0.066766)*sailStates.de;
	Cn = (-2.069568)*sailStates.alpha + (-0.028329)*sailStates.beta + (2.268883)*sailStates.p + (-10.494976)*sailStates.q + (-0.019898)*sailStates.r + (-0.000225)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end