function [aeroForces] = paramSpace_2_3_3_2_2_1_3(sailStates,airStates)

	CL = (4.517965)*sailStates.alpha + (0.100664)*sailStates.beta + (-2.995336)*sailStates.p + (39.426949)*sailStates.q + (-1.390742)*sailStates.r + (0.011502)*sailStates.de;
	CD = -0.473740;
	CY = (-0.080754)*sailStates.alpha + (-0.024944)*sailStates.beta + (-0.561235)*sailStates.p + (0.100924)*sailStates.q + (-0.036782)*sailStates.r + (0.000022)*sailStates.de;

	Cl = (1.505962)*sailStates.alpha + (0.306878)*sailStates.beta + (-1.528668)*sailStates.p + (12.952001)*sailStates.q + (-1.202760)*sailStates.r + (0.000834)*sailStates.de;
	Cm = (-14.019641)*sailStates.alpha + (-0.378013)*sailStates.beta + (9.876902)*sailStates.p + (-148.239990)*sailStates.q + (4.700400)*sailStates.r + (-0.071230)*sailStates.de;
	Cn = (0.240194)*sailStates.alpha + (0.017734)*sailStates.beta + (1.174367)*sailStates.p + (-5.131297)*sailStates.q + (0.004683)*sailStates.r + (-0.000146)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end