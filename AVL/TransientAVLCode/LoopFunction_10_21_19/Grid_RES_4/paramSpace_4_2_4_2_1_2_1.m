function [aeroForces] = paramSpace_4_2_4_2_1_2_1(sailStates,airStates)

	CL = (3.852427)*sailStates.alpha + (0.080772)*sailStates.beta + (-2.069531)*sailStates.p + (32.176384)*sailStates.q + (1.035761)*sailStates.r + (0.010319)*sailStates.de;
	CD = 0.055240;
	CY = (-0.113225)*sailStates.alpha + (-0.025508)*sailStates.beta + (0.315536)*sailStates.p + (-0.455226)*sailStates.q + (-0.062813)*sailStates.r + (-0.000096)*sailStates.de;

	Cl = (1.088225)*sailStates.alpha + (-0.118654)*sailStates.beta + (-0.846474)*sailStates.p + (7.085275)*sailStates.q + (0.746446)*sailStates.r + (-0.000184)*sailStates.de;
	Cm = (-13.207493)*sailStates.alpha + (-0.319075)*sailStates.beta + (6.648031)*sailStates.p + (-122.911674)*sailStates.q + (-3.488015)*sailStates.r + (-0.066547)*sailStates.de;
	Cn = (0.211123)*sailStates.alpha + (0.028072)*sailStates.beta + (-0.554753)*sailStates.p + (2.300197)*sailStates.q + (-0.004830)*sailStates.r + (0.000152)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end