function [aeroForces] = paramSpace_4_4_4_1_1_3_3(sailStates,airStates)

	CL = (7.487738)*sailStates.alpha + (-0.865491)*sailStates.beta + (-3.432934)*sailStates.p + (50.557838)*sailStates.q + (4.014660)*sailStates.r + (0.012352)*sailStates.de;
	CD = -3.130880;
	CY = (0.259702)*sailStates.alpha + (-0.016657)*sailStates.beta + (1.643540)*sailStates.p + (-2.326711)*sailStates.q + (-0.327170)*sailStates.r + (-0.000496)*sailStates.de;

	Cl = (3.178772)*sailStates.alpha + (-0.993925)*sailStates.beta + (-1.829170)*sailStates.p + (18.158731)*sailStates.q + (3.417749)*sailStates.r + (0.001220)*sailStates.de;
	Cm = (-11.612910)*sailStates.alpha + (3.287355)*sailStates.beta + (8.802178)*sailStates.p + (-155.326050)*sailStates.q + (-13.292076)*sailStates.r + (-0.068959)*sailStates.de;
	Cn = (-1.854428)*sailStates.alpha + (0.129498)*sailStates.beta + (-3.335036)*sailStates.p + (15.299409)*sailStates.q + (0.055915)*sailStates.r + (0.000955)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end