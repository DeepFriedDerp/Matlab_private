function [aeroForces] = paramSpace_4_3_4_2_3_2_3(sailStates,airStates)

	CL = (3.650074)*sailStates.alpha + (-0.077290)*sailStates.beta + (-2.888680)*sailStates.p + (38.533646)*sailStates.q + (0.962301)*sailStates.r + (0.010703)*sailStates.de;
	CD = 0.114820;
	CY = (0.086831)*sailStates.alpha + (-0.025508)*sailStates.beta + (0.171222)*sailStates.p + (0.455226)*sailStates.q + (-0.034009)*sailStates.r + (0.000097)*sailStates.de;

	Cl = (1.227922)*sailStates.alpha + (-0.125941)*sailStates.beta + (-1.478660)*sailStates.p + (12.735020)*sailStates.q + (0.678638)*sailStates.r + (0.000857)*sailStates.de;
	Cm = (-13.081310)*sailStates.alpha + (0.309075)*sailStates.beta + (9.665812)*sailStates.p + (-146.782669)*sailStates.q + (-3.286775)*sailStates.r + (-0.068930)*sailStates.de;
	Cn = (-0.342623)*sailStates.alpha + (0.023086)*sailStates.beta + (-0.127652)*sailStates.p + (-0.904906)*sailStates.q + (-0.051444)*sailStates.r + (-0.000133)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end