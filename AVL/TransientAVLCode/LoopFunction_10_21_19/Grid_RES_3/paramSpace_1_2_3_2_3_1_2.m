function [aeroForces] = paramSpace_1_2_3_2_3_1_2(sailStates,airStates)

	CL = (4.883027)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.552560)*sailStates.p + (38.502136)*sailStates.q + (-2.083922)*sailStates.r + (0.011490)*sailStates.de;
	CD = -0.628270;
	CY = (0.105035)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.770652)*sailStates.p + (0.759372)*sailStates.q + (-0.135815)*sailStates.r + (0.000162)*sailStates.de;

	Cl = (1.652901)*sailStates.alpha + (0.355029)*sailStates.beta + (-1.184465)*sailStates.p + (10.767202)*sailStates.q + (-1.680599)*sailStates.r + (0.000290)*sailStates.de;
	Cm = (-13.288940)*sailStates.alpha + (0.000000)*sailStates.beta + (7.501179)*sailStates.p + (-134.568695)*sailStates.q + (6.911151)*sailStates.r + (-0.068277)*sailStates.de;
	Cn = (-0.177934)*sailStates.alpha + (0.062601)*sailStates.beta + (1.566091)*sailStates.p + (-7.117450)*sailStates.q + (0.016336)*sailStates.r + (-0.000359)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end