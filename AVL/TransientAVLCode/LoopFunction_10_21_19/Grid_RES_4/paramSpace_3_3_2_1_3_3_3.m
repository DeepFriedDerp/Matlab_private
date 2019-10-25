function [aeroForces] = paramSpace_3_3_2_1_3_3_3(sailStates,airStates)

	CL = (5.215920)*sailStates.alpha + (-0.177519)*sailStates.beta + (-3.526551)*sailStates.p + (44.694080)*sailStates.q + (2.224222)*sailStates.r + (0.012066)*sailStates.de;
	CD = -1.815510;
	CY = (0.515910)*sailStates.alpha + (-0.025449)*sailStates.beta + (0.880085)*sailStates.p + (1.471501)*sailStates.q + (-0.057736)*sailStates.r + (0.000322)*sailStates.de;

	Cl = (1.256232)*sailStates.alpha + (-0.548336)*sailStates.beta + (-1.943446)*sailStates.p + (16.963196)*sailStates.q + (2.027750)*sailStates.r + (0.001525)*sailStates.de;
	Cm = (-11.436832)*sailStates.alpha + (0.688483)*sailStates.beta + (11.412744)*sailStates.p + (-162.286758)*sailStates.q + (-7.544528)*sailStates.r + (-0.072841)*sailStates.de;
	Cn = (-1.350724)*sailStates.alpha + (0.032474)*sailStates.beta + (-1.913267)*sailStates.p + (7.208077)*sailStates.q + (0.000920)*sailStates.r + (-0.000214)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end