function [aeroForces] = paramSpace_3_3_2_1_3_1_3(sailStates,airStates)

	CL = (6.918422)*sailStates.alpha + (0.168673)*sailStates.beta + (-3.410588)*sailStates.p + (39.375675)*sailStates.q + (-2.219820)*sailStates.r + (0.010979)*sailStates.de;
	CD = -2.800080;
	CY = (-0.277434)*sailStates.alpha + (-0.025449)*sailStates.beta + (-1.219889)*sailStates.p + (1.471502)*sailStates.q + (0.079904)*sailStates.r + (0.000322)*sailStates.de;

	Cl = (2.772112)*sailStates.alpha + (0.597558)*sailStates.beta + (-1.906764)*sailStates.p + (15.559029)*sailStates.q + (-2.130301)*sailStates.r + (0.001525)*sailStates.de;
	Cm = (-15.870257)*sailStates.alpha + (-0.670060)*sailStates.beta + (12.400073)*sailStates.p + (-162.286758)*sailStates.q + (7.519199)*sailStates.r + (-0.072841)*sailStates.de;
	Cn = (1.049055)*sailStates.alpha + (-0.034038)*sailStates.beta + (2.802037)*sailStates.p + (-14.215389)*sailStates.q + (-0.035826)*sailStates.r + (-0.000688)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end