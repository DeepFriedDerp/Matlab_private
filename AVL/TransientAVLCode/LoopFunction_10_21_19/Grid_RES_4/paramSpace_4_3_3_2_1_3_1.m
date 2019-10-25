function [aeroForces] = paramSpace_4_3_3_2_1_3_1(sailStates,airStates)

	CL = (4.752774)*sailStates.alpha + (-0.153422)*sailStates.beta + (-2.147291)*sailStates.p + (35.730469)*sailStates.q + (2.050837)*sailStates.r + (0.011114)*sailStates.de;
	CD = -0.629810;
	CY = (-0.196433)*sailStates.alpha + (-0.024476)*sailStates.beta + (0.769880)*sailStates.p + (-0.455227)*sailStates.q + (-0.153155)*sailStates.r + (-0.000096)*sailStates.de;

	Cl = (1.395897)*sailStates.alpha + (-0.409194)*sailStates.beta + (-0.839664)*sailStates.p + (7.637152)*sailStates.q + (1.665550)*sailStates.r + (-0.000269)*sailStates.de;
	Cm = (-12.192236)*sailStates.alpha + (0.578345)*sailStates.beta + (5.988165)*sailStates.p + (-122.911674)*sailStates.q + (-6.805385)*sailStates.r + (-0.066547)*sailStates.de;
	Cn = (0.717747)*sailStates.alpha + (0.071008)*sailStates.beta + (-1.605777)*sailStates.p + (7.149310)*sailStates.q + (0.021315)*sailStates.r + (0.000240)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end