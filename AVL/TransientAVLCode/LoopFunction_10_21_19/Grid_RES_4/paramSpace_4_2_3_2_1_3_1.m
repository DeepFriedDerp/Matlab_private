function [aeroForces] = paramSpace_4_2_3_2_1_3_1(sailStates,airStates)

	CL = (4.752774)*sailStates.alpha + (0.153422)*sailStates.beta + (-2.147291)*sailStates.p + (35.730465)*sailStates.q + (2.050838)*sailStates.r + (0.011114)*sailStates.de;
	CD = -0.629810;
	CY = (-0.196433)*sailStates.alpha + (-0.025476)*sailStates.beta + (0.769880)*sailStates.p + (-0.455227)*sailStates.q + (-0.153155)*sailStates.r + (-0.000096)*sailStates.de;

	Cl = (1.443849)*sailStates.alpha + (-0.323386)*sailStates.beta + (-0.871201)*sailStates.p + (8.034117)*sailStates.q + (1.671837)*sailStates.r + (-0.000184)*sailStates.de;
	Cm = (-12.192236)*sailStates.alpha + (-0.578345)*sailStates.beta + (5.988165)*sailStates.p + (-122.911674)*sailStates.q + (-6.805383)*sailStates.r + (-0.066547)*sailStates.de;
	Cn = (0.674938)*sailStates.alpha + (0.074712)*sailStates.beta + (-1.599504)*sailStates.p + (7.070349)*sailStates.q + (0.020065)*sailStates.r + (0.000240)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end