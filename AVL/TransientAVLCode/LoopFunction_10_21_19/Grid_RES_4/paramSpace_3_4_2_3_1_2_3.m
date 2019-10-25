function [aeroForces] = paramSpace_3_4_2_3_1_2_3(sailStates,airStates)

	CL = (4.000390)*sailStates.alpha + (-0.081062)*sailStates.beta + (-2.802481)*sailStates.p + (36.830521)*sailStates.q + (0.490719)*sailStates.r + (0.011015)*sailStates.de;
	CD = 0.019690;
	CY = (-0.053181)*sailStates.alpha + (-0.024244)*sailStates.beta + (0.158668)*sailStates.p + (-0.563442)*sailStates.q + (-0.010380)*sailStates.r + (-0.000121)*sailStates.de;

	Cl = (1.285041)*sailStates.alpha + (-0.088088)*sailStates.beta + (-1.359523)*sailStates.p + (11.088854)*sailStates.q + (0.345955)*sailStates.r + (0.000540)*sailStates.de;
	Cm = (-14.406556)*sailStates.alpha + (0.259736)*sailStates.beta + (9.503271)*sailStates.p + (-143.062881)*sailStates.q + (-1.644157)*sailStates.r + (-0.069716)*sailStates.de;
	Cn = (-0.005978)*sailStates.alpha + (0.003390)*sailStates.beta + (-0.266298)*sailStates.p + (1.400290)*sailStates.q + (0.000558)*sailStates.r + (0.000191)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end