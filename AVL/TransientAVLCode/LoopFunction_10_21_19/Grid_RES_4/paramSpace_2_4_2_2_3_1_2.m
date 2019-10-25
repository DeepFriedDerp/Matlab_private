function [aeroForces] = paramSpace_2_4_2_2_3_1_2(sailStates,airStates)

	CL = (4.788899)*sailStates.alpha + (0.343059)*sailStates.beta + (-2.565591)*sailStates.p + (35.961246)*sailStates.q + (-1.545452)*sailStates.r + (0.011098)*sailStates.de;
	CD = -0.614970;
	CY = (0.098822)*sailStates.alpha + (-0.023884)*sailStates.beta + (-0.683705)*sailStates.p + (0.769435)*sailStates.q + (-0.044839)*sailStates.r + (0.000165)*sailStates.de;

	Cl = (1.530418)*sailStates.alpha + (0.408077)*sailStates.beta + (-1.153447)*sailStates.p + (9.440504)*sailStates.q + (-1.343978)*sailStates.r + (0.000192)*sailStates.de;
	Cm = (-14.316910)*sailStates.alpha + (-1.337069)*sailStates.beta + (8.375815)*sailStates.p + (-135.788696)*sailStates.q + (5.238300)*sailStates.r + (-0.068965)*sailStates.de;
	Cn = (-0.304849)*sailStates.alpha + (0.017689)*sailStates.beta + (1.441356)*sailStates.p + (-6.868193)*sailStates.q + (0.011334)*sailStates.r + (-0.000333)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end