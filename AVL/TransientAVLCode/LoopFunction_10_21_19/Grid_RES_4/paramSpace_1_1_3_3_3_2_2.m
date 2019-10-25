function [aeroForces] = paramSpace_1_1_3_3_3_2_2(sailStates,airStates)

	CL = (3.899145)*sailStates.alpha + (-0.211388)*sailStates.beta + (-2.447179)*sailStates.p + (35.070110)*sailStates.q + (-1.100026)*sailStates.r + (0.010515)*sailStates.de;
	CD = 0.043810;
	CY = (0.062688)*sailStates.alpha + (-0.026293)*sailStates.beta + (-0.290629)*sailStates.p + (0.489619)*sailStates.q + (-0.057792)*sailStates.r + (0.000103)*sailStates.de;

	Cl = (1.308348)*sailStates.alpha + (0.051848)*sailStates.beta + (-1.192609)*sailStates.p + (10.449762)*sailStates.q + (-0.772789)*sailStates.r + (0.000422)*sailStates.de;
	Cm = (-13.602196)*sailStates.alpha + (0.726873)*sailStates.beta + (7.946456)*sailStates.p + (-133.122253)*sailStates.q + (3.669485)*sailStates.r + (-0.066591)*sailStates.de;
	Cn = (0.061968)*sailStates.alpha + (0.023493)*sailStates.beta + (0.450058)*sailStates.p + (-1.666017)*sailStates.q + (-0.017070)*sailStates.r + (-0.000179)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end