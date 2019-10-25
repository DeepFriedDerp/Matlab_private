function [aeroForces] = paramSpace_1_1_2_1_1_1_1(sailStates,airStates)

	CL = (4.333149)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.104364)*sailStates.p + (36.789703)*sailStates.q + (-2.047254)*sailStates.r + (0.011240)*sailStates.de;
	CD = -0.589200;
	CY = (-0.053340)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.644293)*sailStates.p + (-1.423509)*sailStates.q + (-0.160589)*sailStates.r + (-0.000296)*sailStates.de;

	Cl = (0.869355)*sailStates.alpha + (0.378087)*sailStates.beta + (-0.800974)*sailStates.p + (7.530126)*sailStates.q + (-1.658729)*sailStates.r + (-0.000227)*sailStates.de;
	Cm = (-10.138856)*sailStates.alpha + (0.000000)*sailStates.beta + (5.652110)*sailStates.p + (-121.603668)*sailStates.q + (6.749915)*sailStates.r + (-0.065245)*sailStates.de;
	Cn = (-0.488276)*sailStates.alpha + (0.094268)*sailStates.beta + (1.369396)*sailStates.p + (-4.546653)*sailStates.q + (-0.022471)*sailStates.r + (0.000303)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end