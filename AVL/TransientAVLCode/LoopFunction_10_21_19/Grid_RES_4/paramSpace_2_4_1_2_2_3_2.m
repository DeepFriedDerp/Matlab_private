function [aeroForces] = paramSpace_2_4_1_2_2_3_2(sailStates,airStates)

	CL = (4.361772)*sailStates.alpha + (-0.134269)*sailStates.beta + (-2.520436)*sailStates.p + (33.519890)*sailStates.q + (0.665220)*sailStates.r + (0.010587)*sailStates.de;
	CD = -0.380460;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.379522)*sailStates.p + (0.000000)*sailStates.q + (0.024875)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.260424)*sailStates.alpha + (-0.232441)*sailStates.beta + (-1.141491)*sailStates.p + (8.790121)*sailStates.q + (0.684824)*sailStates.r + (0.000209)*sailStates.de;
	Cm = (-14.826126)*sailStates.alpha + (0.467949)*sailStates.beta + (8.909245)*sailStates.p + (-136.150452)*sailStates.q + (-2.223467)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (0.250881)*sailStates.alpha + (-0.010278)*sailStates.beta + (-0.933564)*sailStates.p + (4.577367)*sailStates.q + (-0.011628)*sailStates.r + (0.000096)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end